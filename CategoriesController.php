<?php

namespace App\Http\Controllers\Dashboard;
use Illuminate\Support\Facades\Storage;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use validate;
use App\Http\Requests\categoeyRequest;
use Illuminate\Support\Str;
class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query=Category::query();
        $name=$request->name;
        $status=$request->status;
        // if($name=$request->name){
        //     $query->where('name','LIKE',"%{$name}%");
        //    // dd($request->search);
        // }
        // if($status=$request->status){
        //     $query->where('status','=',$status);
        // }
      //  $categories=$query->paginate(1);//Return collection Object
      //  $categories=Category::status($request->status)->paginate();//Return collection Object
      $categories=Category::leftJoin('categories as parent','parent.id','=','categories.parent_id')
      ->select('categories.*','parent.name as parent')
      //->selectRaw('(SELECT COUNT(*) FROM products WHERE category_id = categories.id) as products_count')
      ->withCount('products')->filter($request->query())
      ->latest('name')->paginate(10);
        return view('dashboard.categories.index',compact('categories','name','status'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $parents=Category::all();
        $category=new Category();
        return view('dashboard.categories.create',compact('category','parents'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate(Category::rules(),
            [
                'unique'=>'this name already exist'

            ]
        );
        $request->merge([
            'slug'=>Str::slug($request->name)
            ]);
        $data=$request->except('image');

           $data['image']=$this->uploadFile($request);
           $request->merge([
            'image'=>$data['image'],
           ]);



        $category= Category::create($data);
        //$category->name=$request->post('name');
        //$category->parent_id=$request->post('parent_id');
        return redirect()->route('dashboard.categories.index')->with('success','Category Created');


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
      return view('dashboard.categories.show',[
        'category'=>$category,
      ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $parents=Category::where('id','<>',$id)
        ->where(function($quere)use($id){
            $quere->whereNull('parent_id')
            ->orWhere('parent_id','<>',$id);
        })->get();

        $category=Category::find($id);
        if(!$category){
            abort(404);
        }
        //dd($category);
        return view('dashboard.categories.edit',compact(['category','parents']));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(categoeyRequest $request, $id)
    {
       // $request->validate(Category::rules($id));
        $category=Category::findOrFail($id);
        $old_image=$category->image;
        //dd($old_image);

        $data=$request->except('image');

       $new_image=$this->uploadFile($request);
       if($new_image)
       {
        $data['image']=$new_image;
       }




        // $category->update([
        //     'name'=>$request->name,
        //     'parent_id'=>$request->parent_id
        // ]);
        $category->update($data);
        if($old_image && $new_image)
        {
            Storage::disk('public')->delete($old_image);
        }
        return redirect()->route('dashboard.categories.index')->with('success','Category Update');


        //$category->fill($request->all())->save();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category=Category::findOrFail($id);
        $category->delete();



//dd($old_image);
       //Category::destroy($id);
        return redirect()->route('dashboard.categories.index')->with('success','Category delete');

    }
    protected function uploadFile(Request $request)
    {
        if (!$request->hasFile('image')) {
            Return null;
        }
        $file = $request->file('image');

            $path = $file->store('uploads', [
                'disk' => 'public',
            ]);
         Return $path;
    }

    public function trash(Request $request)
    {
        $name=$request->name;
        $status=$request->status;
         $categories=Category::onlyTrashed()->paginate();
          return view('dashboard.categories.trash',compact('categories','name','status'));
    }
    public function restore(Request $request,$id)
    {
        $category=Category::onlyTrashed()->findOrFail($id);
        $category->restore();
        return redirect()->route('dashboard.categories.trash')->with('success','Category restored !!');

    }
    public function forceDelete($id)
    {
        $category=Category::onlyTrashed()->findOrFail($id);
        $category->forceDelete();
        $old_image=$category['image'];
        if($category->image){
           // dd($old_image);

            Storage::disk('public')->delete($old_image);
        }
        return redirect()->route('dashboard.categories.trash')->with('success','Category Deleted Forever!!');

    }
}


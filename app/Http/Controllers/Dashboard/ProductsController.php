<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use App\Models\Tag;

// use App\Models\Category;
use Illuminate\Support\Str;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
            $products=Product::with(['catrgory','store'])->paginate();

          // $category=Category::find(1);
           //$product=$category->products();//Product::where('category',$category->id);
           //foreach($category->products as $product ){
         //echo $product->name;

           //}
     //dd($products);
     return view('dashboard.products.index',compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product=Product::findOrFail($id);
        $tags=implode(',',$product->tags()->pluck('name')->toArray());
        return view('dashboard.products.edit',compact('product','tags'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Product $product)
    {
       // dd($request->all());
       $product->update($request->except('tags'));
      // dd($request->tags);
       $tags = json_decode($request->post('tags'));
      //  $tags=explode(',',$request->post('tags'));
        $saved_tags=Tag::all();
        foreach($tags as $t_name) {
            $slug=Str::slug($t_name->value);
            $tag=$saved_tags->where('slug',$slug)->first();
            if(!$tag){
                $tag=Tag::create([
                 'name'=>$t_name->value,
                 'slug'=>$slug,
                ]);
            }
            $tags_id[]=$tag->id;
            $product->tags()->sync($tags_id);
            
        }

        return redirect()->route('dashboard.products.index')->with('success','Product Update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

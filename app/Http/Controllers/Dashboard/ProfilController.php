<?php

namespace App\Http\Controllers\Dashboard;
use App\Models\Profile;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\Intl\Countries;
use Symfony\Component\Intl\Locales;

class ProfilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public function edit()
    {
        $user=Auth::user();
            return view('dashboard.profile.edit',[
            'user'=>$user,
            'countries'=>Countries::getNames(),
            'locales'=>Locales::getNames(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
       //dd($request->all());
        $request->validate([
            'first_name'=>['required','string','max:255'],
            'last_name'=>['required','string','max:255'],
            'birthday'=>['nullable','date','before:today'],
            'gender'=>['in:male,female'],
            'country'=>['required']
        ]);
        $user_id=Auth::user()->id;
// dd($user_id);
        DB::table('profiles')->where('user_id', $user_id)->update(array('first_name' => $request->first_name,'last_name' => $request->last_name,
        'birthday'=>$request->birthday,'gender'=>$request->gender,'country'=>$request->country,
        'state'=>$request->state,'postal_code'=>$request->postal_code,'local'=>$request->locale));

        // $user=$request->user();
        // $user->profile->fill($request->all())->save();
        // $profile=$user->profile;
        // if ($profile->user_id) {
        //  $profile->update($request->all());
        // }else {
        //     $request->merge([
        //       'user_id'=>$user->id,
        //     ]);
        //    Profile::create($request->all());
        //    $user->profile()->create($request->all());
        // }
        return redirect()->route('dashboard.profile.edit')->with('sucess','Profile updated !');
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

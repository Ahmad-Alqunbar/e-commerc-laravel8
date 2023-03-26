<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public  function __construct()
    {
         $this->middleware(['auth']);        //all function

        // $this->middleware(['auth'])->except('index');  //all function except index function
        # code...
    //    $this->middleware(['auth'])->only('index');  //only  index function
    }
    public function index(){
        //return response :view ,json,redirct,file
        return view('dashboard.index');
    }
}

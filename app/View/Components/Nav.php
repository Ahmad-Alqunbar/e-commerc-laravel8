<?php

namespace App\View\Components;
use Route;

use Illuminate\View\Component;

class Nav extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $active= Route::currentRouteName();
        $items=[
            [
            'icon'=>'nav-icon fas fa-tachometer-alt',
            'route'=>'dashboard.dashboard',
            'title'=>'Dashboard',
           'active'=>'dashboard.dashboard',
        ]
        ,
        [
            'icon'=>'far fa-circle nav-icon',
            'route'=>'dashboard.categories.index',
            'title'=>'Categories',
            'badeg'=>'New',
            'active'=>'dashboard.categories.*',

        ]
        ,
        [
            'icon'=>'far fa-circle nav-icon',
            'route'=>'dashboard.products.index',
            'title'=>'Products',
            'badeg'=>'New',
            'active'=>'dashboard.products.*',

        ]
        ];
        return view('components.nav',['items'=>$items,'active'=>$active]);
    }
}

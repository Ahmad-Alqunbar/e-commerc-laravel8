<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth as FacadesAuth;

class Product extends Model
{
    protected $fillable=[
        'name',
        'slug',
        'description',
        'image',
        'price',
        'compare_price',
        'options',
        'rating',
        'featured',
        'status',
     ] ;
    public  function tags()
    {
        return $this->belongsToMany(
        Tag::class,//Related model
       'product_tag',//pivot table model
       'product_id',//fk.in pivot table for the current model
       'tag_id',//fk.in pivot table for the current model
       'id',// PK current model
       'id',// PK related model

        );
    }
    public function ScopeActive(Builder $builder)
    {
        $builder->where('status','=',1);
    }
    public function catrgory()
    {
        return $this->belongsTo(Category::class,'category_id','id');
    }
    public function store()
    {
        return $this->belongsTo(Store::class,'store_id','id')->withDefault();
    }

    protected $table='products';
    protected static function booted()
    {
        static::addGlobalScope('store',function (Builder $builder)
        {
            $user=Auth::user();
            if($user && $user->store_id){
                $builder->where('store_id','=',$user->store_id);
            }
                    });
    }

    use HasFactory;
}

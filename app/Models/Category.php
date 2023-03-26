<?php

namespace App\Models;
use Illuminate\Database\Eloquent;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    public function parent()
    {
        return $this->belongsTo(Category::class,'parent_id','id');
    }
    public function child()
    {
        return $this->hasMany(Category::class,'parent_id','id');
    }
    public function products()
    {
        return $this->hasMany(Product::class,'category_id','id');
    }
    public function scopeActive(Builder $builder){
     $builder->where('categories.status','=','active');
    }
    public function scopeStatus(Builder $builder ,$status){
        $builder->where('categories.status','=',$status);
       }


       public function scopeFilter(Builder $builder,$filters)
       {
        if($filters['name'] ?? false){
            $builder->where('categories.name','LIKE',"%{$filters['name']}%");
           // dd($request->search);
        }
        if($filters['status'] ?? false){
            $builder->where('categories.status','=',$filters['status']);
        }
       }

    use HasFactory,SoftDeletes;
    protected $fillable=[
    'name',
    'parent_id',
    'description',
    'status',
    'image',
    'slug'
        ];
        public function rules($id=0){
            return[
                'name'=>[ 'required',
                'string',
                'min:3',
                'max:255',
                Rule::unique('categories','name')->ignore($id),
                 function ($attribute, $value,$fails)
                {
                      if(strtolower($value)=="laravel"){
                         $fails('This name is forbidden!');
                      }
                },
             ],
                'parent_id'=>[
                    'nullable','int',
                    'exists:categories,id'
                ],
                'image'=>[
                    'image',
                  //  'max:1048576','dimensions:width=100,height=100,',
                ],
                'status'=>'required|in:active,archived'
            ];

        }
}

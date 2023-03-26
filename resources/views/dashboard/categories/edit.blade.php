@extends('layouts.dashboard')

@section('title','Edit Categories ')

@section('breadcrumb')
@parent
<li class="breadcrumb-item"><a href="#"> Categories </a></li>
<li class="breadcrumb-item"><a href="#"> Edit Categories </a></li>

@endsection

@section('contant')
<form action="{{ route('dashboard.categories.update',$category->id) }}" method="post"enctype="multipart/form-data">
    @csrf
@method('PUT')
@include('dashboard.categories._form',[

    'button_label'=>'Update'
])
</form>


@endsection

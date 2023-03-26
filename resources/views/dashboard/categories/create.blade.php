@extends('layouts.dashboard')

@section('title','Categories ')

@section('breadcrumb')
@parent
<li class="breadcrumb-item"><a href="#"> Create Categories </a></li>
@endsection

@section('contant')
<form action="{{ route('dashboard.categories.store') }}" method="post"enctype="multipart/form-data">
@csrf
@include('dashboard.categories._form')

</form>


@endsection

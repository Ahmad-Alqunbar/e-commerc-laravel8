@extends('layouts.dashboard')

@section('title',$category->name)

@section('breadcrumb')
@parent
<li class="breadcrumb-item"><a href="#"> Categories </a></li>
<li class="breadcrumb-item"><a href="#"> {{$category->name}} </a></li>

@endsection

@section('contant')

<table class="table">
    <thead>
        <tr>
            <th></th>
            <th>Name</th>
            <th>Store</th>
            <th>status</th>
            <th>Created at</th>
        </tr>
    </thead>
    <tbody>
@php
    $products=$category->products()->with('store')->paginate(3);
@endphp
        @forelse ($category->products()->with('store')->paginate(3) as $product)
            <tr>
                <td><img height="50" src="{{ asset('storage/' . $product->image) }}"></td>
                <td>{{ $product->name }}</td>
              <td>{{ $product->store->name }}</td>

                <td>{{ $product->status }}</td>
                <td>{{ $product->created_at }}</td>

            </tr>
        @empty
            <tr>
                <td colspan="5">No Categories defined !!</td>
            </tr>
        @endforelse

    </tbody>
</table>
{{ $products->links() }}

@endsection

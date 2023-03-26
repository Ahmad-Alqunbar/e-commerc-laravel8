@extends('layouts.dashboard')

@section('title', 'Products ')

@section('breadcrumb')
    @parent
    <li class="breadcrumb-item"><a href="#">Products </a></li>
@endsection

@section('contant')
    <div class="mb-5">
       {{-- <a href="{{ route('dashboard.products.create') }}" class="btn btn-sm btn-outline-primary mr-2">Create </a> --}}
        {{-- <a href="{{ route('dashboard.products.trash') }}" class="btn btn-sm btn-outline-dark">Trash</a> --}}

    </div>
    <x-alert type="success" />
    <form action="{{ URL::current() }}" method="get" class="d-flex justify-content-between mb-4">
        {{-- <input type="text" class="form-control mx-2" name="name" id="name"placeholder="Name" value="{{ $name }}"> --}}
        <select name="status"class="form-control mx-2">
            <option value="">All</option>
            <option value="active">Active</option>
            <option value="archived">Archived</option>
        </select>
        <button class="btn btn-dark mx-2" type="submit">Filter</button>
    </form>
    <table class="table">
        <thead>
            <tr>
                <th></th>
                <th>ID</th>
                <th>Name</th>
                <th>Store</th>
                <th>Category</th>
                <th>status</th>
                <th>Created at</th>
                <th colspan="1">Action</th>
            </tr>
        </thead>
        <tbody>

            @forelse ($products as $product)
                <tr>
                    <td><img height="50" src="{{ asset('storage/' . $product->image) }}"></td>
                    <td>{{ $product->id }}</td>
                    <td>{{ $product->name }}</td>
                  <td>{{ $product->store->name }}</td>

                 <td>{{ $product->catrgory->name }}</td>
                    <td>{{ $product->status }}</td>
                    <td>{{ $product->created_at }}</td>
                    <td>
                        <a href="{{ route('dashboard.products.edit', [$product->id]) }}"
                            class="btn btn-sm btn-outline-success">Edit</a>
                    </td>
                    <td>
                        <form action="{{ route('dashboard.products.destroy', [$product->id]) }}" method="post">
                            @csrf
                            <!--form method spoofing-->
                            <input type="hidden"name="_method"value="delete">
                            <button type="submit"class="btn btn-sm btn-outline-danger">Delete</button>
                        </form>

                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="9">No Categories defined !!</td>
                </tr>
            @endforelse

        </tbody>
    </table>
    {{ $products->withQueryString()->appends(['search'=>1])->links() }}

@endsection

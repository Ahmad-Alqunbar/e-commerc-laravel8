@extends('layouts.dashboard')

@section('title', 'Categories ')

@section('breadcrumb')
    @parent
    <li class="breadcrumb-item"><a href="#">Categories </a></li>
@endsection

@section('contant')
    <div class="mb-5">
        <a href="{{ route('dashboard.categories.create') }}" class="btn btn-sm btn-outline-primary mr-2">Create </a>
        <a href="{{ route('dashboard.categories.trash') }}" class="btn btn-sm btn-outline-dark">Trash</a>

    </div>
    <x-alert type="success" />
    <form action="{{ URL::current() }}" method="get" class="d-flex justify-content-between mb-4">
        <input type="text" class="form-control mx-2" name="name" id="name"placeholder="Name" value="{{ $name }}">
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
                <th>Parent</th>
                <th>status</th>

                <th>Created at</th>
                <th>Product Count</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>

            @forelse ($categories as $category)
                <tr>
                    <td><img height="50" src="{{ asset('storage/' . $category->image) }}"></td>
                    <td>{{ $category->id }}</td>
                    <td><a href="{{ route('dashboard.categories.show',$category->id) }}"> {{ $category->name }}</a></td>
                    <td>{{ $category->parent }}</td>

                    <td>{{ $category->status }}</td>
                    <td>{{ $category->created_at }}</td>
                    <td>{{ $category->products_count }}</td>
                    <td>
                        <a href="{{ route('dashboard.categories.edit', [$category->id]) }}"
                            class="btn btn-sm btn-outline-success">Edit</a>
                    </td>
                    <td>
                        <form action="{{ route('dashboard.categories.destroy', [$category->id]) }}" method="post">
                            @csrf
                            <!--form method spoofing-->
                            <input type="hidden"name="_method"value="delete">
                            <button type="submit"class="btn btn-sm btn-outline-danger">Delete</button>
                        </form>

                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">No Categories defined !!</td>
                </tr>
            @endforelse

        </tbody>
    </table>
    {{ $categories->withQueryString()->appends(['search'=>1])->links() }}

@endsection

@extends('layouts.dashboard')

@section('title', 'Trashed Categories ')

@section('breadcrumb')
    @parent
    <li class="breadcrumb-item">Categories </li>
    <li class="breadcrumb-item active">Trash</li>

@endsection

@section('contant')
    <div class="mb-5">
        <a href="{{ route('dashboard.categories.index') }}" class="btn btn-sm btn-outline-primary">Back</a>
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
                <th>status</th>

                <th>Deleted at</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>

            @forelse ($categories as $category)
                <tr>
                    <td><img height="50" src="{{ asset('storage/' . $category->image) }}"></td>
                    <td>{{ $category->id }}</td>
                    <td>{{ $category->name }}</td>
                    <td>{{ $category->status }}</td>
                    <td>{{ $category->deleted_at }}</td>
                    <td>
                        <form action="{{ route('dashboard.categories.restore', [$category->id]) }}" method="post">
                            @csrf
                            <!--form method spoofing-->
                            <input type="hidden"name="_method"value="put">
                            <button type="submit"class="btn btn-sm btn-outline-info">Restore</button>
                        </form>
                    </td>
                    <td>
                        <form action="{{ route('dashboard.categories.force-delete', [$category->id]) }}" method="post">
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

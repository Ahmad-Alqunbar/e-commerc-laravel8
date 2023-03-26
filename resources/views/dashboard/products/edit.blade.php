@extends('layouts.dashboard')

@section('title', 'Edit Products ')

@section('breadcrumb')
    @parent
    <li class="breadcrumb-item"><a href="#"> Edit Profile </a></li>

@endsection

@section('contant')
    <form action="{{ route('dashboard.products.update', [$product]) }}) }}" method="post"enctype="multipart/form-data">
        @csrf
        @method('patch')
        @if ($errors->any())
            <div class="alert alert-danger">
                <h1>Error Occured !</h1>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>

        @endif

        <div class="form-group">
            <label for=""> Name:</label>
            <input type="text"
                name="name"class="form-control"value="{{ old('name', $product->name) }}">
        </div>
      
        <div class="form-group">
            <label for="">category</label>
            <select type="text" name="parent_id"class="form-control form-select">
                <option value="">Select Category</option>
                @foreach (App\Models\Category::all() as $category)
                    <option value="{{ $category->id }}"@if ($product->catrgory->name == $category->name) selected @endif>
                        {{ $category->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="">Description</label>
            <textarea  name="description"class="form-control">{{old('description',$product->description)}}</textarea>
        </div>
        <div class="form-group">
            <label for="">Image</label>
            <input type="file" name="image"class="form-control"accept='image/*'>
            @if ($product->image)
            <img  src="{{asset( 'storage/'.$product->image) }}">
            @endif
        </div>
        <div class="form-group">
            <label for=""> Price:</label>
            <input type="number"
                name="price"class="form-control"value="{{ old('price', $product->price) }}">
        </div>
        <div class="form-group">
            <label for=""> compare price:</label>
            <input type="number"
                name="compare_price"class="form-control"value="{{ old('compare_price', $product->compare_price) }}">
        </div>

        <div class="form-group">
            <label for="">Tags</label>
            <input type="text"name="tags"class="form-control"value="{{$tags}}">
        </div>
        <div class="form-group">
            <label for="">Status</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="status"  value="1" @if(old('status',$product->status)=='1') checked @else unchecked @endif>
                <label class="form-check-label" for="exampleRadios1">
                 Active
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="status"  value="2" @if(old('status',$product->status)=='2')  checked @else unchecked @endif>
                <label class="form-check-label" for="exampleRadios2">
                Draft
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="status"  value="3" @if(old('status',$product->status)=='3') checked @else unchecked @endif>
                <label class="form-check-label" for="exampleRadios2">
                    archived
                </label>
              </div>
            </div>
        <div class="form-group">
            <button type="submit" name="submit"class="btn btn-primary">{{ $button_label ?? 'Save' }}</button>
        </div>
    </form>


@endsection

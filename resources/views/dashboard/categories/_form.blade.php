@if($errors->any())
<div class="alert alert-danger">
    <h1>Error Occured !</h1>
    <ul>
        @foreach ($errors->all() as $error )
        <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>

@endif
<x-form.input name="name" :value="$category->name"/>

<div class="form-group">
    <label for="">Category parent</label>
    <select type="text" name="parent_id"class="form-control form-select">
        <option value="">Primary Category</option>
        @foreach ($parents as $parent)
        <option value="{{ $parent->id }}"@if(old('parent_id',$category->parent_id)==$parent->id)  selected @endif>{{ $parent->name }}</option>

        @endforeach
    </select>
</div>

<div class="form-group">
    <label for="">Description</label>
    <textarea  name="description"class="form-control">{{old('description',$category->description)}}</textarea>
</div>
<div class="form-group">
    <label for="">Image</label>
    <input type="file" name="image"class="form-control"accept='image/*'>
    @if ($category->image)
    <img  src="{{asset( 'storage/'.$category->image) }}">
    @endif
</div>
<div class="form-group">
<label for="">Status</label>
<div class="form-check">
    <input class="form-check-input" type="radio" name="status"  value="active" @if(old('status',$category->status)=='active') checked @endif>
    <label class="form-check-label" for="exampleRadios1">
     Active
    </label>
  </div>
  <div class="form-check">
    <input class="form-check-input" type="radio" name="status"  value="archived"@if(old('status',$category->status)=='active') @else checked @endif>
    <label class="form-check-label" for="exampleRadios2">
     Archived
    </label>
  </div>
</div>
<div class="form-group">
    <button type="submit" name="submit"class="btn btn-primary">{{ $button_label ?? 'Save' }}</button>
</div>

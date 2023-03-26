@props(
    [
        'type'=>'text','name'=>'name','value'=>''
    ]
)

<div class="form-group">
    <label for="">Category Name</label>
    <input
    type="{{ $type ?? 'text' }}"
    name="{{ $name }}" @class([
        'form-control',
        'is-invalid'=>$errors->has('name')
    ]) value="{{ old('name',$value) }} ">
    @if ($errors->has('name'))
    <div class="invalid-feedback">
        {{ $errors->first('name') }}
    </div>

    @endif
</div>

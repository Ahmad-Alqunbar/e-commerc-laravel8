@extends('layouts.dashboard')

@section('title', 'Edit Profile ')

@section('breadcrumb')
    @parent
    <li class="breadcrumb-item"><a href="#"> Edit Profile </a></li>

@endsection

@section('contant')
    <form action="{{ route('dashboard.profile.update') }}" method="post"enctype="multipart/form-data">
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
            <label for="">First Name:</label>
            <input type="text"
                name="first_name"class="form-control"value="{{ old('first_name', $user->profile->first_name) }}">
        </div>
        <div class="form-group">
            <label for="">last Name:</label>
            <input type="text"
                name="last_name"class="form-control"value="{{ old('last_name', $user->profile->last_name) }}">
        </div>
        <div class="form-group">
            <label for="">Birthday</label>
            <input type="date" name="birthday"class="form-control"value="{{ old('birthday', $user->profile->birthday) }}">
        </div>
        <div class="form-group">
            <label for="">gender</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender"id="male" value="male"
                    @if (old('gender', $user->profile->gender) == 'male') checked @endif>
                <label class="form-check-label" for="male">
                    Male
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender"id="female"
                    value="female"@if (old('gender', $user->profile->gender) == 'female') checked @endif>
                <label class="form-check-label" for="female">
                    Female
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="">Street Address:</label>
            <input type="text"
                name="street_address"class="form-control"value="{{ old('street_address', $user->profile->street_address) }}">
        </div>
        <div class="form-group">
            <label for="">City:</label>
            <input type="text" name="city"class="form-control"value="{{ old('city', $user->profile->city) }}">
        </div>
        <div class="form-group">
            <label for="">state:</label>
            <input type="text" name="state"class="form-control"value="{{ old('state', $user->profile->state) }}">
        </div>
        <div class="form-group">
            <label for="">Postal Code:</label>
            <input type="text"
                name="postal_code"class="form-control"value="{{ old('postal_code', $user->profile->postal_code) }}">
        </div>
        <div class="form-group">
            <label for="">Country</label>
            <select type="text" name="country"class="form-control form-select">
                <option value="">Select country</option>
                @foreach ($countries as $country)
                    <option value="{{ $country }}"@if ($user->profile->country == $country) selected @endif>
                        {{ $country }}</option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="">locale</label>
            <select type="text" name="locale"class="form-control form-select">
                <option value="">Select locale</option>
                @foreach ($locales as $locale)
                    <option value="{{ $locale }}"@if ($user->profile->local == $locale) selected @endif>
                        {{ $locale }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <button type="submit" name="submit"class="btn btn-primary">{{ $button_label ?? 'Save' }}</button>
        </div>
    </form>


@endsection

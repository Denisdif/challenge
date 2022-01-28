@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">
                    Vouchers
                </div>
                <div class="card-body" style="overflow: scroll;">
                    {{$vouchers}}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
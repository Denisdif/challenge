@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="row">
                <div class="col">
                    <h1>View All Vouchers</h1>
                </div>
                <div class="col">
                    <!-- Button trigger modal -->
                    <div class="float-end">
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exportModal">Export</button>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <form>
                        @include('filtros')
                        <div class="float-end">
                            <button type="submit" class="btn btn-primary">Filtrar</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-body" style="overflow-x: scroll;">
                    @include('vouchers_table')
                    <div class="d-flex justify-content-center">
                        {!! $vouchers->links() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@include('modal_export')
@endsection
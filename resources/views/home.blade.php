@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">
                    Filtros
                </div>
                <div class="card-body">
                    <form>
                        <div class="row">
                            <div class="mb-3 col">
                                <label for="number" class="form-label">Voucher#</label>
                                <input type="text" class="form-control" id="number" name="number">
                            </div>
                            <div class="mb-3 col">
                                <label for="account" class="form-label">Account</label>
                                <input type="text" class="form-control" id="account" name="account">
                            </div>
                            <div class="mb-3 col">
                                <label for="create_date_start" class="form-label">Create Date Start</label>
                                <input type="date" class="form-control" id="create_date_start" name="create_date_start">
                            </div>
                            <div class="mb-3 col">
                                <label for="create_date_end" class="form-label">Create Date End</label>
                                <input type="date" class="form-control" id="create_date_end" name="create_date_end">
                            </div>
                            <div class="mb-3 col">
                                <label for="brand" class="form-label">Brand</label>
                                <select class="form-select" name="brand" id="brand">
                                    <option value="">All</option>
                                    <option value="Avis">Avis</option>
                                    <option value="Budget">Budget</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Filtrar</button>
                      </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    Vouchers
                </div>
                <div class="card-body" style="overflow: scroll;">
                    <table class="table table-striped table-hover">
                        <thead>
                          <tr>
                            <th scope="col">Voucher#</th>
                            <th scope="col">CBA</th>
                            <th scope="col">Brand</th>
                            <th scope="col">Account Name</th>
                            <th scope="col">Issuer Name</th>
                            <th scope="col">Voucher Status</th>
                            <th scope="col">Past Due</th>
                            <th scope="col">Payment File</th>
                            <th scope="col">Customer Last Name</th>
                            <th scope="col">Confirmation #</th>
                            <th scope="col">Issue IATA</th>
                            <th scope="col">Gross Amount</th>
                            <th scope="col">GSA Net Amount</th>
                            <th scope="col">ABG Net Amount</th>
                            <th scope="col">User</th>
                            <th scope="col">Create Date</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach ($vouchers as $item)
                                <tr>
                                    <td>{{$item->number}}</td>
                                    <td>{{$item->account}}</td>
                                    <td>{{$item->company->name}}</td>
                                    <td>{{$item->gsaOrganization->name}}</td>
                                    <td>{{$item->organization->name}}</td>
                                    <td>{{$item->voucherStatus->name}}</td>
                                    <td>{{$item->past_due}}</td>
                                    <td>{{$item->paymentFiles ? $item->paymentFiles->paymentFileStatus->name : ""}}</td>
                                    <td>{{$item->booking ? $item->booking->last_name : ""}}</td>
                                    <td>{{$item->booking ? $item->booking->number : ""}}</td>
                                    <td>{{$item->iata_code}}</td>
                                    <td>{{$item->gross_amount}}</td>
                                    <td>{{$item->gsa_amount}}</td>
                                    <td>{{$item->abg_amount}}</td>
                                    <td>{{$item->user->name}} {{$item->user->last_name}}</td>
                                    <td>{{$item->issue_date}}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
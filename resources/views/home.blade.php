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
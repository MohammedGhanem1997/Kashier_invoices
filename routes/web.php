<?php
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\UsersController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\lib\Ghanem_Kashier\paymentRequest;
use Illuminate\Support\Facades\Request;
Route::get('login', [LoginController::class, 'userLoginForm'])->name('login');
Route::get('admin/login', [LoginController::class, 'adminLoginForm'])->name('adminLoginForm');
Route::post('login', [LoginController::class, 'userlogin']);
Route::post('admin/login', [LoginController::class, 'adminLogin']);
Route::post('logout', [LoginController::class, 'destroy'])->middleware('auth');

Route::get('/subscribe/{user_id}', [\App\Http\Controllers\Client\HomeController::class, 'subscribe'])->name('subscribe');





Route::middleware('auth:admin')->group(function () {
    Route::inertia('/home', 'Home');
    Route::inertia('/', 'Home');
    Route::inertia('/settings', 'Settings');

    Route::get('/users', [UsersController::class, 'index']);
    Route::get('/users/create', [UsersController::class, 'create']);
    Route::post('/users', [UsersController::class, 'store']);


    // order
    Route::prefix('order')->as('order')->group(function () {

        Route::post('store', [\App\Http\Controllers\OrderController::class, 'store'])->name('store');
        Route::get('show/{id}', [\App\Http\Controllers\OrderController::class, 'show'])->name('show');
    });


//invoice
    Route::prefix('invoice')->as('invoice')->group(function () {
        Route::get('/view', [\App\Http\Controllers\InvoiceController::class, 'index'])->name('index');
        Route::get('/show/{id}', [\App\Http\Controllers\InvoiceController::class, 'show'])->name('create');
        Route::post('store', [\App\Http\Controllers\InvoiceController::class, 'store'])->name('store');
    });

});



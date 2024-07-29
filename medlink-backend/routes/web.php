<?php

use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\EHRController;
use App\Http\Controllers\EMSController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\DoctorController;

Route::middleware('auth')->group(function () {
    Route::get('/appointments', [AppointmentController::class, 'index']);
    Route::post('/appointments', [AppointmentController::class, 'store']);
    Route::get('/appointments/{id}', [AppointmentController::class, 'show']);
    
    Route::get('/ehrs', [EHRController::class, 'index']);
    Route::post('/ehrs', [EHRController::class, 'store']);
    Route::get('/ehrs/{id}', [EHRController::class, 'show']);
    
    Route::get('/ems', [EMSController::class, 'index']);
    Route::post('/ems', [EMSController::class, 'store']);
    
    Route::get('/patients', [PatientController::class, 'index']);
    Route::post('/patients', [PatientController::class, 'store']);
    Route::get('/patients/{id}', [PatientController::class, 'show']);
    
    Route::get('/doctors', [DoctorController::class, 'index']);
    Route::post('/doctors', [DoctorController::class, 'store']);
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

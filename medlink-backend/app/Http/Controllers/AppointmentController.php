<?php

namespace App\Http\Controllers;

use App\Models\Appointment;
use Illuminate\Http\Request;

class AppointmentController extends Controller
{
    public function index()
    {
        $appointments = Appointment::all();
        return view('appointments.index', compact('appointments'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'doctor_id' => 'required|exists:doctors,id',
            'patient_id' => 'required|exists:patients,id',
            'appointment_date' => 'required|date',
        ]);

        Appointment::create($request->all());

        return redirect()->route('appointments.index');
    }

    public function show($id)
    {
        $appointment = Appointment::find($id);
        return view('appointments.show', compact('appointment'));
    }
}


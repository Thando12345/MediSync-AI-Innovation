<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments</title>
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <h1 class="text-4xl font-bold text-teal-600 mb-6">Appointments</h1>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow-md rounded-md border border-gray-200">
                <thead>
                    <tr class="bg-teal-500 text-white">
                        <th class="p-4 text-left">Doctor</th>
                        <th class="p-4 text-left">Patient</th>
                        <th class="p-4 text-left">Date</th>
                        <th class="p-4 text-left">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($appointments as $appointment)
                        <tr class="border-b border-gray-200">
                            <td class="p-4">{{ $appointment->doctor->name }}</td>
                            <td class="p-4">{{ $appointment->patient->name }}</td>
                            <td class="p-4">{{ $appointment->appointment_date }}</td>
                            <td class="p-4">{{ $appointment->status }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

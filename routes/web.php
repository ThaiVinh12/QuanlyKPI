<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Manager\DashboardController as ManagerDashboardController;
use App\Http\Controllers\Manager\LoaiKpiController;
use App\Http\Controllers\Manager\KpiController as ManagerKpiController;
use App\Http\Controllers\Manager\TasksController as ManagerTasksController;
use App\Http\Controllers\User\DashboardController as UserDashboardController;
use App\Http\Controllers\User\TasksController as UserTasksController;
use App\Http\Controllers\User\CalendarController as UserCalendarController;
use App\Http\Controllers\KpiController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PhongbanController;
use App\Http\Controllers\ReportsController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\User\KpiController as UserKpiController;
use App\Models\Thongbao;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ProfileController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::middleware('auth')->group(function () {
    // Redirect dashboard theo role
    Route::get('/dashboard', function () {
        $user = Auth::user();
        switch ($user->ID_quyen) {
            case 1: // Admin
                return redirect()->route('dashboard.index');
            case 2: // Manager
                return redirect()->route('manager.dashboard.index');
            case 3: // Employee
                return redirect()->route('user.dashboard.index');
            default:
                return redirect()->route('dashboard.index');
        }
    })->name('dashboard');

    // Admin routes
    Route::middleware('admin')->group(function () {
        Route::get('/admin/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');
        Route::resource('kpi', KpiController::class);
        Route::resource('loaikpi', LoaiKpiController::class);
        Route::resource('users', UserController::class);
        Route::resource('phongban', PhongbanController::class);
        Route::get('/reports', [ReportsController::class, 'index'])->name('reports.index');
        Route::get('/activity', [ActivityController::class, 'index'])->name('activity.index');

        // LoaiKpi Management
        Route::resource('kpi-type', \App\Http\Controllers\LoaiKpiController::class)->names([
            'index' => 'kpi_type.index',
            'store' => 'kpi_type.store',
            'update' => 'kpi_type.update',
            'destroy' => 'kpi_type.destroy'
        ]);
    });

    // Manager routes
    Route::prefix('manager')->middleware(['auth', 'manager'])->group(function () {
        Route::get('/dashboard', [ManagerDashboardController::class, 'index'])->name('manager.dashboard.index');

        // KPI Management
        Route::resource('kpi', ManagerKpiController::class)->names([
            'index' => 'manager.kpi.index',
            'store' => 'manager.kpi.store',
            'destroy' => 'manager.kpi.destroy'
        ]);

        Route::post('kpi/{id}/progress', [ManagerKpiController::class, 'updateProgress'])->name('manager.kpi.progress');
        Route::get('kpi/{id}/submissions', [ManagerKpiController::class, 'viewSubmissions'])->name('manager.kpi.submissions');
        Route::post('kpi/{id}/evaluation', [ManagerKpiController::class, 'updateEvaluation'])->name('manager.kpi.evaluation');
        Route::get('/kpi/file/{id}/download', [ManagerKpiController::class, 'downloadFile'])->name('manager.kpi.download');

        

        // Tasks Management
        Route::resource('tasks', \App\Http\Controllers\Manager\TasksController::class)->names([
            'index' => 'manager.tasks.index',
            'store' => 'manager.tasks.store',
            'update' => 'manager.tasks.update',
            'destroy' => 'manager.tasks.destroy'
        ]);
        Route::get('tasks/{id}/submissions', [ManagerTasksController::class, 'viewTaskSubmissions'])->name('manager.tasks.submissions');
        Route::post('tasks/{taskId}/approve/{userId}', [ManagerTasksController::class, 'approveTask'])->name('manager.tasks.approve');
        Route::post('tasks/{taskId}/reject/{userId}', [ManagerTasksController::class, 'rejectTask'])->name('manager.tasks.reject');
        Route::get('tasks/file/{dulieuId}/download', [ManagerTasksController::class, 'downloadSubmissionFile'])->name('manager.tasks.download');
    });

    // Employee routes
    Route::prefix('user')->middleware(['auth', 'employee:employee'])->group(function () {
        Route::get('/dashboard', [UserDashboardController::class, 'index'])->name('user.dashboard.index');

        // KPI Management
        Route::get('/kpi', [UserKpiController::class, 'index'])->name('user.kpi.index');
        Route::post('/kpi/{id}/submit', [UserKpiController::class, 'submit'])->name('user.kpi.submit');
        Route::get('/kpi/file/{id}/download', [UserKpiController::class, 'downloadFile'])->name('user.kpi.download');
        Route::get('/kpi/{id}/submissions', [UserKpiController::class, 'viewSubmissions'])->name('user.kpi.submissions');

        // Tasks Management
        Route::get('/tasks', [UserTasksController::class, 'index'])->name('user.tasks.index');
        Route::post('/tasks/{id}/status', [UserTasksController::class, 'updateStatus'])->name('user.tasks.status');
        Route::post('/tasks/{id}/submit', [UserTasksController::class, 'submitTask'])->name('user.tasks.submit');
        Route::get('/tasks/{id}/submission', [UserTasksController::class, 'viewSubmission'])->name('user.tasks.submission');
        Route::get('/tasks/{id}/download', [UserTasksController::class, 'downloadFile'])->name('user.tasks.download');

        // Calendar
        Route::get('/calendar', [UserCalendarController::class, 'index'])->name('user.calendar.index');
    });

    // Thêm routes cho thông báo
    Route::get('/notifications', [NotificationController::class, 'getNotifications'])->name('notifications');
    Route::post('/notifications/{id}/read', [NotificationController::class, 'markAsRead'])->name('notifications.read');
    Route::post('/notifications/read-all', [NotificationController::class, 'markAllAsRead'])->name('notifications.read-all');
    Route::post('/notifications/mark-all-read', [NotificationController::class, 'markAllAsRead'])->name('notifications.mark-all-read');
    Route::get('/notifications/unread-count', [NotificationController::class, 'getUnreadCount'])->name('notifications.unread-count');

    // Profile routes
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::put('/profile/password', [ProfileController::class, 'updatePassword'])->name('profile.update-password');
});

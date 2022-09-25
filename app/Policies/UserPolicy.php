<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Admin;

use Auth;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    public function create(Admin $user)
    {

        return true;
    }

    public function edit(Admin $user, User $model)
    {

        return Auth::guard('admin')->user();     // 👀

    }
}

<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        $users = [
            [
                'id'             => 1,
                'name'           => 'Admin',
                'email'          => 'wessen333@gmail.com',
                'password'       => '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe',
                'remember_token' => null,
            ],
            [
                'id'             => 2,
                'name'           => 'User 1',
                'email'          => 'wondwessenh41@gmail.com',
                'password'       => '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe',
                'remember_token' => null,
            ],
            [
                'id'             => 3,
                'name'           => ' user 2',
                'email'          => 'wessen3333@gmail.com',
                'password'       => '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe',
                'remember_token' => null,
            ],
            [
                'id'             => 4,
                'name'           => 'user 3',
                'email'          => 'wessen33333@gmail.com',
                'password'       => '$2a$12$HWvovW7LPyykOo.8Ey93dOh5vdIwfhdQVLD7BHW1EQo9S6nSlNywe',
                'remember_token' => null,
            ],
        ];

        User::insert($users);
    }
}

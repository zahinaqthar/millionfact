<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    private $respons =[
        'massage'=> null,
        'data'=>null
    ];
    
    public function register(Request $req)
    {
        //validate
        $rules = [
            'name'=>'required|string',
            'email'=>'required|string|unique:users',
            'password'=> 'required|string|min:6'
        ];
        $validator = Validator::make($req->all(), $rules);

        if  ($validator->fails()){
            return response()->json($validator->errors(), 400);
        }

        //create new user in users table
        $user = User::create([
            'name'=>$req->name,
            'email' => $req->email,
            'password' => Hash::make($req->password)
        ]);
        $token = $user->createToken('Personal Access Token')->plainTextToken;
        $response = ['users'=>$user, 'token'=>$token];

        return response()->json($response, 200);
    }

    public function login(Request $req){
        //validates input
        $rules=[
            'email' => 'required',
            'password' => 'required|string'
        ];
        $req->validate($rules);
        //find user email in users table
        $user = User::where('email', $req->email)->first();
        //if user email found and password is correct
        if($user && Hash::check($req->password, $user->password)){
            $token = $user->createToken("Personal Access Token")->plainTextToken;
            $response = ['user'=>$user, 'token'=>$token];
            return response()->json($response, 200);
        }
        $response = ['massage'=>'incorrect email or password'];
        return response()->json($response, 400);
    }

    // public function logout(Request $req){
    //     $req->user()->currentAccessToken->delete();
    //     return response()->json([
    //         'massage'=>'logged out',
    //         'data' => $req->user()
    //     ],200);
        // $rules=[
        //     'token' => 'required',
        // ];
        // $validator = Validator::make($req->all(), $rules);
        // $req->token;
        // $req->revoke();
        // if  ($validator->fails()){
        //     return response()->json($validator->errors(), 400);
        // }
        // if(Auth::user()){
        //    /** @var \App\Models\MyUserModel $user **/
        //  $user = Auth::user();
        //  $user->token();
        //  $user->revoke();
        // return response()->json([
        //   'success' => true,
        //   'message' => 'Logout successfully',
        //  ]);
        // } else{
        //  return response()->json([
        //   'success' => false,
        //   'message' => 'Unable to Logout',
        //  ]);
        // }
    //    }
    public function logout(){
        $logout = auth()->user()->currentAccessToken()->delete();
        $this->respons['massage']='success';

        return response()->json($this->respons,200);
    }
}

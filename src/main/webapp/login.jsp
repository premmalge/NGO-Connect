<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>NGO Connect - Login</title>

<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-br from-[#020617] via-[#0f172a] to-[#1e3a8a]">

    <!-- MAIN CONTAINER -->
    <div class="w-[95%] max-w-7xl h-[85vh] rounded-2xl overflow-hidden shadow-2xl flex">

        <!-- LEFT IMAGE SECTION -->
        <div class="w-1/2 relative hidden md:block overflow-hidden">

            <!-- IMAGE -->
            <img src="images/loginimage.jpeg"
                 class="w-full h-full object-cover scale-105"/>

            <!-- OVERLAY -->
            <div class="absolute inset-0 bg-gradient-to-br from-black/70 via-black/40 to-transparent"></div>

            <!-- LOGO ONLY -->
            <div class="absolute top-6 left-6 bg-black/30 px-4 py-2 rounded-xl backdrop-blur-md">
                <img src="images/logo-image.png"
                     class="h-16 w-auto object-contain drop-shadow-lg"/>
            </div>

            <!-- TEXT -->
            <div class="absolute bottom-10 left-8 text-white max-w-md">
                <h2 class="text-3xl font-semibold leading-snug drop-shadow-2xl">
                    Be the reason someone smiles today 🌼
                </h2>
            </div>

        </div>

        <!-- RIGHT LOGIN SECTION -->
        <div class="w-full md:w-1/2 flex items-center justify-center p-4 md:p-6">

            <!-- GLASS CARD -->
            <div class="w-full max-w-md bg-white/25 backdrop-blur-lg p-8 rounded-2xl border border-white/30 shadow-2xl text-white transition duration-500 hover:scale-[1.02]">

                <h2 class="text-3xl font-semibold mb-6 text-center">
                    Welcome Back
                </h2>

                <!-- FORM -->
                <form action="LoginServlet" method="post" class="space-y-4">

                    <!-- EMAIL -->
                    <div class="relative">
                        <input type="email" name="email" placeholder="Enter Email"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">📧</span>
                    </div>

                    <!-- PASSWORD -->
                    <div class="relative">
                        <input type="password" name="password" placeholder="Enter Password"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">🔒</span>
                    </div>

                    <!-- OPTIONS -->
                    <div class="flex justify-between items-center text-sm text-gray-200">
                        <label class="flex items-center gap-2">
                            <input type="checkbox" class="accent-green-500">
                            Remember Me
                        </label>
                        <a href="#" class="hover:text-green-400">Forgot Password?</a>
                    </div>

                    <!-- BUTTON -->
                    <button type="submit"
                        class="w-full py-3 rounded-lg bg-gradient-to-r from-green-400 to-green-600 font-semibold text-black hover:scale-105 hover:shadow-lg hover:shadow-green-500/30 transition">
                        Login
                    </button>

                    <!-- SIGNUP -->
                    <p class="text-center text-sm text-gray-200">
                        Don’t have an account?
                        <a href="register.jsp" class="text-green-400 hover:underline">Sign up</a>
                    </p>

                </form>

            </div>

        </div>

    </div>

</body>
</html>
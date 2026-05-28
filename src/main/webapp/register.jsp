<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>NGO Connect - Register</title>

<!-- Tailwind CDN -->
<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="min-h-screen flex items-center justify-center bg-gradient-to-br from-[#020617] via-[#0f172a] to-[#1e3a8a]">

    <!-- MAIN CONTAINER -->
    <div class="w-[95%] max-w-7xl h-[85vh] rounded-2xl overflow-hidden shadow-2xl flex relative">

        <!-- LEFT IMAGE SECTION -->
        <div class="w-1/2 relative hidden md:block overflow-hidden">

            <!-- IMAGE -->
            <img src="images/volunteer.jpg"
                 class="w-full h-full object-cover scale-105"/>

            <!-- OVERLAY -->
            <div class="absolute inset-0 bg-gradient-to-br from-black/70 via-black/40 to-transparent"></div>

            <!-- BOTTOM GRADIENT -->
            <div class="absolute bottom-0 left-0 w-full h-32 bg-gradient-to-t from-black/60 to-transparent"></div>

            <!-- TEXT -->
            <div class="absolute bottom-20 left-8 right-8 text-white">
                <h2 class="text-3xl font-semibold leading-snug drop-shadow-2xl">
                    Make a difference, one act of kindness at a time 💚
                </h2>
            </div>

        </div>

        <!-- RIGHT REGISTER SECTION -->
        <div class="w-full md:w-1/2 flex items-center justify-center p-4 md:p-6">

            <!-- GLASS CARD -->
            <div class="w-full max-w-lg bg-white/25 backdrop-blur-lg p-8 rounded-2xl border border-white/30 shadow-2xl text-white transition duration-500 hover:scale-[1.02]">

                <h2 class="text-3xl font-semibold mb-6 text-center">
                    Create Account
                </h2>

                <!-- FORM -->
                <form action="RegisterServlet" method="post" class="space-y-4">

                    <!-- NAME -->
                    <div class="relative">
                        <input type="text" name="name" placeholder="Full Name"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">👤</span>
                    </div>

                    <!-- EMAIL -->
                    <div class="relative">
                        <input type="email" name="email" placeholder="Email Address"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">📧</span>
                    </div>

                    <!-- PASSWORD -->
                    <div class="relative">
                        <input type="password" name="password" placeholder="Password"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">🔒</span>
                    </div>

                    <!-- CONFIRM PASSWORD -->
                    <div class="relative">
                        <input type="password" name="confirmPassword" placeholder="Confirm Password"
                               class="w-full p-3 pl-10 rounded-lg bg-white/10 border border-white/20 placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-green-400"/>
                        <span class="absolute left-3 top-3">🔐</span>
                    </div>

                    <!-- BUTTON -->
                    <button type="submit"
                        class="w-full py-3 rounded-lg bg-gradient-to-r from-green-400 via-green-500 to-green-600 font-semibold text-black hover:scale-105 hover:shadow-xl hover:shadow-green-500/30 transition duration-300">
                        Register
                    </button>

                    <!-- LOGIN LINK -->
                    <p class="text-center text-sm text-gray-200">
                        Already have an account?
                        <a href="login.jsp" class="text-green-400 hover:underline">Login</a>
                    </p>

                </form>

            </div>

        </div>

        <!-- 🔥 TOP RIGHT LOGO (HEADER STYLE) -->
        <div class="absolute top-6 right-8">
            <img src="images/logo-image.png"
                 class="h-16 w-auto object-contain drop-shadow-xl"/>
        </div>

    </div>

</body>
</html>
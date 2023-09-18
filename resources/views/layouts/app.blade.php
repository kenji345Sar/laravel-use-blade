<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Laravel Sample')</title>
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

    <!-- Header -->
    @include('partials.header')

    <div id="app">
        @yield('content')
    </div>

    <!-- Footer -->
    @include('partials.footer')

    <script src="{{ asset('js/app.js') }}"></script>
</body>

</html>

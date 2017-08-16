<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>

    <link rel="stylesheet" type="text/css" href="{{ asset('css/materialize.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/public.min.css') }}">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    @yield('css')
</head>
<body>
    @yield('body')
</body>

<script rel="script" type="text/javascript" href="{{ asset('js/jquery.min.js') }}"></script>
<script rel="script" type="text/javascript" href="{{ asset('js/materialize.min.js') }}"></script>
@yield('js')

</html>
<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" type="text/css" href="{{ asset('css/materialize.min.css') }}">

    @yield('css')
</head>
<body>
    @yield('body')
</body>

<script rel="script" type="text/javascript" href="{{ asset('js/jquery.min.js') }}"></script>
<script rel="script" type="text/javascript" href="{{ asset('js/materialize.min.js') }}"></script>
@yield('js')

</html>
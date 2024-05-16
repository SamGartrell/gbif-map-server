vcl 4.0;

backend default {
    .host = "pg_tileserv";
    .port = "7800";
}

sub vcl_recv {
    # Set the backend to use
    set req.backend_hint = default;
}

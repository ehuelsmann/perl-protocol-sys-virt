#!perl

requires 'perl' => '5.14.1';
requires 'Log::Any';


on test => sub {
    requires 'Test2::V0';
};

on develop => sub {
    requires 'Dist::Zilla';
    requires 'XDR::Gen';
    requires 'XDR::Parse' => '0.3.1';
};

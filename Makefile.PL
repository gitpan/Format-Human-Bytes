use inc::Module::Install;

name     'Format-Human-Bytes';
all_from 'lib/Format/Human/Bytes.pm';
author   'Sebastian Willing <sewi@cpan.org>';
license  'perl';

build_requires 'Test::More';
build_requires 'Module::Install';

auto_install;

WriteAll;


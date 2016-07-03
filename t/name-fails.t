use strict;
use warnings;

use Test2::Bundle::Extended;
use Test2::Plugin::NoWarnings;
use Test::Without::Module qw( Sub::Name );

use Params::ValidationCompiler qw( validation_for );

{
    my $e = dies {
        validation_for(
            name   => 'Check for X',
            params => { foo => 1 },
        );
    };

    like(
        $e,
        qr/\QCannot name a generated validation subroutine. Please install Sub::Name./,
        'passing name when Sub::Name is not installed fails',
    );
}

done_testing();

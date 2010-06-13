use Test::Most;
use DateTime::Format::Czech;
use DateTime;

my $fmt = DateTime::Format::Czech->new;
is $fmt->format(DateTime->new(year=>2010, month=>1, day=>13)),
    '13. ledna', "format_datetime correctly aliased as `format'";

done_testing;

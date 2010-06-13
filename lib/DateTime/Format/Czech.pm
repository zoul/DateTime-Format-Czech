package DateTime::Format::Czech;

use utf8;
use Moose;

has show_time => (is => 'ro', isa => 'Bool', default => 0);
has show_date => (is => 'ro', isa => 'Bool', default => 1);
has show_year => (is => 'ro', isa => 'Bool', default => 0);
has month_by_name => (is => 'ro', isa => 'Bool', default => 1);
has compound_format => (is => 'ro', isa => 'Str', default => '%s v %s');

my @MONTH_NAMES = qw/
    ledna února března dubna
    května června července srpna září
    října listopadu prosince/;

sub format_date
{
    my ($self, $date) = @_;
    my $output = $self->month_by_name ?
        join('. ', $date->day, $MONTH_NAMES[$date->month_0]) :
        sprintf '%i. %i.', $date->day, $date->month;
    $output .= ' ' . $date->year if $self->show_year;
    return $output;
}

sub format_time
{
    my ($self, $date) = @_;
    return sprintf '%i.%02i', $date->hour, $date->minute;
}

sub format_datetime
{
    my ($self, $date) = @_;
    if ($self->show_time && $self->show_date) {
        return sprintf $self->compound_format,
            $self->format_date($date), $self->format_time($date);
    }
    return $self->format_date($date) if $self->show_date;
    return $self->format_time($date);
}

'SDG';

package hwforums::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    #TEMPLATE_EXTENSION => '.tt',
    #render_die => 1,
    
    # Change default TT extension
    TEMPLATE_EXTENSION => '.tt2',
    # Set the location for TT files
    INCLUDE_PATH => [
            hwforums->path_to( 'root', 'src' ),
        ],
    # Set to 1 for detailed timer stats in your HTML as comments
    TIMER              => 0,
    # This is your wrapper template located in the 'root/src'
    WRAPPER => 'wrapper.tt2',
);

=head1 NAME

hwforums::View::HTML - TT View for hwforums

=head1 DESCRIPTION

TT View for hwforums.

=head1 SEE ALSO

L<hwforums>

=head1 AUTHOR

Vo Nguyen Hiep

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

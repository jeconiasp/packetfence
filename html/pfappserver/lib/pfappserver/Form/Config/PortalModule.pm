package pfappserver::Form::Config::PortalModule;

=head1 NAME

pfappserver::Form::Config::PortalModule

=head1 DESCRIPTION

Form definition to create or update a portal module.

=cut

use HTML::FormHandler::Moose;
extends 'pfappserver::Base::Form';
with 'pfappserver::Base::Form::Role::Help';

## Definition
has_field 'id' =>
  (
   type => 'Text',
   label => 'Identifier',
   required => 1,
   messages => { required => 'Please specify an identifier' },
  );

has_field 'type' =>
  (
   type => 'Hidden',
   messages => { required => 'There was no type specified' },
  );

has_field 'description' =>
  (
   type => 'Text',
   label => 'Description',
   required => 1,
   tags => { after_element => \&help,
             help => 'The description that will be displayed to users' },
  );

has_block definition =>
  (
   render_list => [ qw(id type description), child_definition() ],
  );


# To override in the child modules
sub child_definition {
    return ();
}

=over

=back

=head1 COPYRIGHT

Copyright (C) 2005-2016 Inverse inc.

=head1 LICENSE

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
USA.

=cut

__PACKAGE__->meta->make_immutable;
1;

package pf::ConfigStore::MultiCluster;

=head1 NAME

pf::ConfigStore::MultiCluster

=cut

=head1 DESCRIPTION

pf::ConfigStore::MultiCluster

=cut

use strict;
use warnings;
use Moo;
use pf::file_paths qw($multi_cluster_config_file);
extends 'pf::ConfigStore';

has '+configFile' => ( default => $multi_cluster_config_file );

sub pfconfigNamespace {}

=head2 cleanupAfterRead

Clean up section data (expand fields)

=cut

sub cleanupAfterRead {
    my ($self, $id, $data) = @_;
    $self->expand_list($data, $self->_fields_expanded);
}

=head2 cleanupBeforeCommit

Clean data before update or creating

=cut

sub cleanupBeforeCommit {
    my ($self, $id, $data) = @_;
    my $real_id = $self->_formatSectionName($id);
    my $config = $self->cachedConfig;
    # Clear the section of any previous values
    $config->ClearSection($real_id);
    $self->flatten_list($data, $self->_fields_expanded);
}

=head2 _fields_expanded

=cut

sub _fields_expanded {
    return qw(regions clusters standalone_servers);
}

__PACKAGE__->meta->make_immutable;

=head1 AUTHOR

Inverse inc. <info@inverse.ca>

=head1 COPYRIGHT

Copyright (C) 2005-2017 Inverse inc.

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

1;


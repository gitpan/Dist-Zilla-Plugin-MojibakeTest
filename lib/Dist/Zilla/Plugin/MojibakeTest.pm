package Dist::Zilla::Plugin::MojibakeTest;

use strict;
use warnings;

# ABSTRACT: Release tests making sure no char encoding problems is in the code

our $VERSION = '0.001'; # VERSION

use Moose 0.99;
use namespace::autoclean 0.09;

extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;

1;




=pod

=encoding utf-8

=head1 NAME

Dist::Zilla::Plugin::MojibakeTest - Release tests making sure no char encoding problems is in the code

=head1 VERSION

version 0.001

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing
the following files:

=over 4

=item *

xt/release/mojibake.t

a standard Test::Mojibake test

=back

=head1 AUTHOR

Alexei Znamensky <russoz@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Alexei Znamensky.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc Dist::Zilla::Plugin::MojibakeTest

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

The default CPAN search engine, useful to view POD in HTML format.

L<http://search.cpan.org/dist/Dist-Zilla-Plugin-MojibakeTest>

=item *

AnnoCPAN

The AnnoCPAN is a website that allows community annonations of Perl module documentation.

L<http://annocpan.org/dist/Dist-Zilla-Plugin-MojibakeTest>

=item *

CPAN Ratings

The CPAN Ratings is a website that allows community ratings and reviews of Perl modules.

L<http://cpanratings.perl.org/d/Dist-Zilla-Plugin-MojibakeTest>

=item *

CPAN Forum

The CPAN Forum is a web forum for discussing Perl modules.

L<http://cpanforum.com/dist/Dist-Zilla-Plugin-MojibakeTest>

=item *

CPANTS

The CPANTS is a website that analyzes the Kwalitee ( code metrics ) of a distribution.

L<http://cpants.perl.org/dist/overview/Dist-Zilla-Plugin-MojibakeTest>

=item *

CPAN Testers

The CPAN Testers is a network of smokers who run automated tests on uploaded CPAN distributions.

L<http://www.cpantesters.org/distro/D/Dist-Zilla-Plugin-MojibakeTest>

=item *

CPAN Testers Matrix

The CPAN Testers Matrix is a website that provides a visual way to determine what Perls/platforms PASSed for a distribution.

L<http://matrix.cpantesters.org/?dist=Dist-Zilla-Plugin-MojibakeTest>

=back

=head2 Internet Relay Chat

You can get live help by using IRC ( Internet Relay Chat ). If you don't know what IRC is,
please read this excellent guide: L<http://en.wikipedia.org/wiki/Internet_Relay_Chat>. Please
be courteous and patient when talking to us, as we might be busy or sleeping! You can join
those networks/channels and get help:

=over 4

=item *

irc.perl.org

You can connect to the server at 'irc.perl.org' and join this channel: #sao-paulo.pm to get help.

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://github.com/russoz/Dist-Zilla-Plugin-MojibakeTest/issues>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see L<http://search.cpan.org/dist/Dist-Zilla-Plugin-MojibakeTest/>.

The development version lives at L<http://github.com/russoz/Dist-Zilla-Plugin-MojibakeTest>
and may be cloned from L<git://github.com/russoz/Dist-Zilla-Plugin-MojibakeTest.git>.
Instead of sending patches, please fork this project using the standard
git and github infrastructure.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT
WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER
PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE
TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.

=cut


__DATA__
___[ xt/release/mojibake.t ]___
use strict;
use warnings;

BEGIN {
    unless ($ENV{RELEASE_TESTING}) {
        require Test::More;
        Test::More::plan(skip_all => 'these tests are for release candidate testing');
    }
}

use Test::More;

eval { use Test::Mojibake; };
plan skip_all => 'Test::Mojibake required' if $@;

all_files_encoding_ok();


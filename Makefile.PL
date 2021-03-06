use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "check xt tests before release",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>, Jesse Luehrs <doy\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Dist-Zilla-Plugin-CheckExtraTests",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.006",
  "NAME" => "Dist::Zilla::Plugin::CheckExtraTests",
  "PREREQ_PM" => {
    "App::Prove" => "3.00",
    "Archive::Tar" => 0,
    "Dist::Zilla" => "4.3",
    "Dist::Zilla::App" => 0,
    "Dist::Zilla::Role::BeforeRelease" => 0,
    "Dist::Zilla::Role::TestRunner" => 0,
    "File::pushd" => 0,
    "Moose" => 2,
    "Path::Iterator::Rule" => 0,
    "Path::Tiny" => "0.013",
    "namespace::autoclean" => "0.09",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Capture::Tiny" => 0,
    "Dist::Zilla::App::Tester" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Params::Util" => 0,
    "Sub::Exporter" => 0,
    "Test::More" => "0.88",
    "Test::Requires" => 0,
    "Try::Tiny" => 0,
    "lib" => 0
  },
  "VERSION" => "0.029",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "App::Prove" => "3.00",
  "Archive::Tar" => 0,
  "Capture::Tiny" => 0,
  "Dist::Zilla" => "4.3",
  "Dist::Zilla::App" => 0,
  "Dist::Zilla::App::Tester" => 0,
  "Dist::Zilla::Role::BeforeRelease" => 0,
  "Dist::Zilla::Role::TestRunner" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "File::pushd" => 0,
  "Moose" => 2,
  "Params::Util" => 0,
  "Path::Iterator::Rule" => 0,
  "Path::Tiny" => "0.013",
  "Sub::Exporter" => 0,
  "Test::More" => "0.88",
  "Test::Requires" => 0,
  "Try::Tiny" => 0,
  "lib" => 0,
  "namespace::autoclean" => "0.09",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

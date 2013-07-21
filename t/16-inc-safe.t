# Check if @INC is manipulated by certain library modules.

# Author: Martin Becker, February 2013.
# This code is put into public domain.  You can do with it what you like.

BEGIN {
    print "1..1\n";
    my @old_inc = @INC;
    require Crypt::RSA;
    require Crypt::RSA::Key::Private::SSH;
    my $success = @old_inc == @INC;
    if (!$success) {
        print "# BEFORE:\n";
        foreach my $i (0 .. $#old_inc) {
            print '#   $INC[', $i, '] was ', $old_inc[$i], "\n";
        }
        print "# AFTER:\n";
        foreach my $i (0 .. $#INC) {
            print '#   $INC[', $i, '] is  ', $INC[$i], "\n";
        }
    }
    print $success? (): 'not ', "ok 1 - size of \@INC unchanged\n";
}

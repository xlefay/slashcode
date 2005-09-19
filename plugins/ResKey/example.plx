use Slash::Test shift;

my($reskey, $key);

#$Slash::ResKey::DEBUG = 1;

for (1..1) {
	$reskey = getObject('Slash::ResKey');
	$rkey = $reskey->key('comments');

	handle($rkey->create);
	handle($rkey->touch);
	handle($rkey->touch);
	handle($rkey->use);
	sleep 5;
	handle($rkey->use);

	print Dumper $rkey;
}


sub handle {
	my($success) = @_;
	if ($success) {
		printf "%s'd %s\n", ucfirst($rkey->{type}), $rkey->reskey;
	} else {
		printf "Error on %s: %s\n", $rkey->{type}, $rkey->errstr;
	}
}

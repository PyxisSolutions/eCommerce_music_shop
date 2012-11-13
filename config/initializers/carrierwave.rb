CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: "AWS",
		aws_access_key_id: "AKIAJ4TPEHBSQQPIMGHA",
		aws_secret_access_key: "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"
	}
	config.fog_directory = "ecommerce_music_shop"
end
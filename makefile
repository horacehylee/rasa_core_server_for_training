train:
	make train-nlu
	make train-dialogue

train-nlu:
	rm -rf models/current/nlu
	python -m rasa_nlu.train --config nlu_model_config.yml --data data/nlu --path models  --project current --fixed_model_name nlu

train-dialogue:
	rm -rf models/current/dialogue
	python -m rasa_core.train --domain domain.yml --stories data/dialogue --out models/current/dialogue --nlu models/current/nlu --epochs 200

run-server:
	python -m rasa_core.server --core models/current/dialogue --nlu models/current/nlu --log_file out.log --verbose --port 5000
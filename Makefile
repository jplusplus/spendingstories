# Makefile -- Spending Stories

WEBAPP     = $(wildcard */webapp.py)
PYC        = $(wildcard *.pyc webapp/*.pyc webapp/*/*.pyc webapp/*/*/*.pyc webapp/*/*/*/*.pyc webapp/*/*/*/*/*.pyc libs/*.pyc libs/*/*.pyc libs/*/*/*.pyc)
CACHE      = $(wildcard staticfiles/CACHE)
RM         = rm -fr

run: clean
	. `pwd`/.env ; python manage.py runserver

clean:
	$(RM) $(PYC)
	$(RM) $(CACHE)

install:
	virtualenv venv --no-site-packages --distribute --prompt=SpendingStories
	. `pwd`/.env ; pip install -r requirements_core.txt
	npm install
	. `pwd`/.env ; python manage.py syncdb && python manage.py migrate

test:
	. `pwd`/.env ; python manage.py test --settings webapp.settings_tests

# EOF

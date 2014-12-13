from django.shortcuts import render_to_response
from django.template import RequestContext
from django.views.decorators.csrf import csrf_exempt
import RPi.GPIO as GPIO
import time


def open_close_garage():

	GPIO.setmode(GPIO.BCM)
	GPIO.setup(2, GPIO.OUT, initial=GPIO.HIGH)
	GPIO.output(2, GPIO.LOW)
	time.sleep(.1)
	GPIO.output(2, GPIO.HIGH)
	GPIO.cleanup()


@csrf_exempt
def home(request):

	if request.GET.get('trigger'):
		open_close_garage()

	context = {}

	return render_to_response('home.html', context, context_instance=RequestContext(request))





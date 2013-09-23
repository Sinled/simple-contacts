# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext_lazy as _


class Contact(models.Model):

    first_name = models.CharField(verbose_name=_(u'Ваше имя'), max_length=100)
    last_name = models.CharField(verbose_name=_(u'Ваша фамилия'), max_length=100)
    phone = models.CharField(verbose_name=_(u'Контактный телефон'), max_length=18)
    position = models.CharField(verbose_name=_(u'Должность'), max_length=100)

    def __unicode__(self):
        return self.user_name

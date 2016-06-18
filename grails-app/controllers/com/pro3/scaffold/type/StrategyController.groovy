package com.pro3.scaffold.type

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StrategyController {
    static scaffold = Strategy
}

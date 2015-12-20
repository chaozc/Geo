#!/usr/bin/env python

# example drawingarea.py

import pygtk
pygtk.require('2.0')
import gtk
import operator
import time
import string
import sys

class DrawingAreaExample:
    def __init__(self):
        window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        window.set_title("Drawing Area Example")
        window.connect("destroy", lambda w: gtk.main_quit())
        self.area = gtk.DrawingArea()
        self.area.set_size_request(400, 300)
        self.pangolayout = self.area.create_pango_layout("")
        self.sw = gtk.ScrolledWindow()
        self.sw.add_with_viewport(self.area)
        self.table = gtk.Table(2,2)
        self.hruler = gtk.HRuler()
        self.vruler = gtk.VRuler()
        self.hruler.set_range(0, 400, 0, 400)
        self.vruler.set_range(0, 300, 0, 300)
        self.table.attach(self.hruler, 1, 2, 0, 1, yoptions=0)
        self.table.attach(self.vruler, 0, 1, 1, 2, xoptions=0)
        self.table.attach(self.sw, 1, 2, 1, 2)
        window.add(self.table)
        self.area.set_events(gtk.gdk.POINTER_MOTION_MASK |
                             gtk.gdk.POINTER_MOTION_HINT_MASK )
        self.area.connect("expose-event", self.area_expose_cb)
        def motion_notify(ruler, event):
            return ruler.emit("motion_notify_event", event)
        self.area.connect_object("motion_notify_event", motion_notify,
                                 self.hruler)
        self.area.connect_object("motion_notify_event", motion_notify,
                                 self.vruler)
        self.hadj = self.sw.get_hadjustment()
        self.vadj = self.sw.get_vadjustment()
        def val_cb(adj, ruler, horiz):
            if horiz:
                span = self.sw.get_allocation()[3]
            else:
                span = self.sw.get_allocation()[2]
            l,u,p,m = ruler.get_range()
            v = adj.value
            ruler.set_range(v, v+span, p, m)
            while gtk.events_pending():
                gtk.main_iteration()
        self.hadj.connect('value-changed', val_cb, self.hruler, True)
        self.vadj.connect('value-changed', val_cb, self.vruler, False)
        def size_allocate_cb(wid, allocation):
            x, y, w, h = allocation
            l,u,p,m = self.hruler.get_range()
            m = max(m, w)
            self.hruler.set_range(l, l+w, p, m)
            l,u,p,m = self.vruler.get_range()
            m = max(m, h)
            self.vruler.set_range(l, l+h, p, m)
        self.sw.connect('size-allocate', size_allocate_cb)
        self.area.show()
        self.hruler.show()
        self.vruler.show()
        self.sw.show()
        self.table.show()
        window.show()

    def area_expose_cb(self, area, event):
        self.style = self.area.get_style()
        self.gc = self.style.fg_gc[gtk.STATE_NORMAL]
        
        i = 0
        try:
            while args[i]:
                if (args[i] == 'line'):
                    self.draw_line(int(args[i+1]), int(args[i+2])) # slope and intercept
                    i += 3
                elif (args[i] == 'segment'):
                    self.draw_segment(int(args[i+1]), int(args[i+2]), int(args[i+3]), int(args[i+4])) # endpoint 1 and 2
                    i += 5
                elif (args[i] == 'dot'):
                    self.draw_point(int(args[i+1]), int(args[i+2])) # x and y
                    i += 3
                elif (args[i] == 'circle'):
                    self.draw_arcs(int(args[i+1]), int(args[i+2]), int(args[i+3])) # center and radius
                    i += 4
                elif (args[i] == 'polygon'):
                    # gtk.Widget.queue_draw()
                    i += 1
                    vertices = []
                    try:
                        while (args[i] and args[i].isdigit()):
                            vertices.append((int(args[i]), int(args[i+1])))
                            i += 2
                    except IndexError:
                        pass

                    self.draw_polygon(vertices)
                else:
                    print "??????????????????"

        except IndexError:
            pass
        return True

    def draw_point(self, x, y):
        self.area.window.draw_point(self.gc, x, y)
        self.pangolayout.set_text("Point")
        self.area.window.draw_layout(self.gc, x+5, y+50, self.pangolayout)
        return

    def draw_line(self, a, b):
        self.area.window.draw_line(self.gc, 0, b, -b/a, 0)
        self.pangolayout.set_text("Line")
        self.area.window.draw_layout(self.gc, a+5, b+50, self.pangolayout)
        return

    def draw_segment(self, x1, y1, x2, y2):
        self.area.window.draw_line(self.gc, x1, y1, x2, y2)
        self.pangolayout.set_text("Segment")
        self.area.window.draw_layout(self.gc, x1+5, y1+80, self.pangolayout)
        return

    def draw_arcs(self, x, y, r):
        self.area.window.draw_arc(self.gc, False, x-r, y-r, 2*r, 2*r, 0, 360*64)
        self.pangolayout.set_text("Arcs")
        self.area.window.draw_layout(self.gc, x+5, y+80, self.pangolayout)
        return

    def draw_polygon(self, vertices):
        self.area.window.draw_polygon(self.gc, False, vertices)
        self.pangolayout.set_text("Polygon")
        self.area.window.draw_layout(self.gc, 5, 80, self.pangolayout)
        return

args = []

def main():
    gtk.main()
    return 0

if __name__ == "__main__":
    args = sys.argv[1:]
    DrawingAreaExample()
    main()
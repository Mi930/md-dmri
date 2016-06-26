function EG = mgui_roi_setup_gui(EG, h)
% function EG = mgui_roi_setup_gui(EG, h)

tags.SLICE_SLIDER   = EG.t_ROI_SLICE_SLIDER;
tags.SLICE_PLUS     = EG.t_ROI_SLICE_PLUS;
tags.SLICE_MINUS    = EG.t_ROI_SLICE_MINUS;
tags.TRA            = EG.t_ROI_TRA;
tags.SAG            = EG.t_ROI_SAG;
tags.COR            = EG.t_ROI_COR;
tags.AXES           = EG.t_ROI_AXES;
tags.ZOOM_AXES      = EG.t_ROI_ZOOM_AXES;
tags.ZOOM_PLUS      = EG.t_ROI_ZOOM_PLUS;
tags.ZOOM_MINUS     = EG.t_ROI_ZOOM_MINUS;
tags.ZOOM_PANEL     = EG.t_ROI_ZOOM_PANEL;
tags.do_zoom = 1;

[EG.handles.h_roi_axes, EG.handles.h_roi_black, ...
    EG.handles.h_roi_zoom, EG.handles.h_roi_zoom_black] = ...
    mgui_gui_volume_setup(h, tags, EG.f_roi_gui_callback);

EG.roi_volume_tags = tags;



% ----- roi-buttons on top
left = 15;
b    = 660;
w    = 32;
th   = 20;
mw   = 4;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...    
    'Style','pushbutton',...
    'String','R+',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_PLUS, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','R-',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_MINUS, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Undo',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_UNDO, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Clear',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_CLEAR, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw  * 4;

% ------ windowing ----------
uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','edit',...
    'String','Min',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_WINDOW_MIN, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','edit',...
    'String','Max',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_WINDOW_MAX, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Auto',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_WINDOW_AUTO, ...
    'Callback', EG.f_roi_gui_callback);


left = left + w + mw * 4 + 5;


% time series analysis related stuff

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','edit',...
    'String', 'Vol',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_ANALYSIS_CVOL, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Vol-',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_ANALYSIS_MINUS, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Vol+',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_ANALYSIS_PLUS, ...
    'Callback', EG.f_roi_gui_callback);


left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Play',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_ANALYSIS_PLAY, ...
    'Callback', EG.f_roi_gui_callback);

left = left + w + mw;

uicontrol(...
    'Parent', h, ...
    'FontSize', EG.conf.default_font_size, ...
    'Style','pushbutton',...
    'String','Stop',...
    'Units', 'pixels', ...
    'Position',[left b w th], ...
    'Tag', EG.t_ROI_ANALYSIS_STOP, ...
    'Callback', EG.f_roi_gui_callback);

% left = left + w + mw*2;


% Handle resizing: Warning for ugly code, needs rethink (XXX)
set(h, 'ResizeFcn', @mgui_roi_resize);
t_fixed_top = {...
    EG.t_ROI_PLUS, ...
    EG.t_ROI_MINUS, ...
    EG.t_ROI_WINDOW, ...
    EG.t_ROI_UNDO, ...
    EG.t_ROI_CLEAR, ...
    EG.t_ROI_WINDOW_MIN, ...
    EG.t_ROI_WINDOW_MAX, ...
    EG.t_ROI_WINDOW_AUTO, ...
    EG.t_ROI_ANALYSIS_MINUS, ...
    EG.t_ROI_ANALYSIS_PLUS, ...
    EG.t_ROI_ANALYSIS_PLAY, ...
    EG.t_ROI_ANALYSIS_STOP};

h_fixed_top = [];
for c = 1:numel(t_fixed_top)
    h_fixed_top = [h_fixed_top findobj('Tag', t_fixed_top{c})];
end
tmp_p1 = get(h_fixed_top(1), 'Position');
tmp_p2 = get(h, 'Position');
d_fixed_top = tmp_p2(4) - tmp_p1(2);

tmp_p1 = get(EG.handles.h_roi_axes, 'position');
d_roi_top    = tmp_p2(4) - tmp_p1(2) - tmp_p1(4);
d_roi_bottom = tmp_p1(2);
d_roi_left   = tmp_p1(1);
d_roi_right  = tmp_p2(3) - d_roi_left - tmp_p1(3);


h_zoom = get(EG.handles.h_roi_zoom(1),'parent');

    function mgui_roi_resize(h,varargin)
        
        if (~exist('h_fixed_top', 'var')), return; end
        
        % Ensure we're working in pixels and get the position
        old_units = get(h,'Units');
        set(h,'Units','pixels');
        p_parent = get(h,'Position');
        
        % Keep some elements at top
        for h_elem = h_fixed_top
            p = get(h_elem, 'position');
            p(2) = p_parent(4) - d_fixed_top;
            set(h_elem, 'position', p);
        end
        
        % Enlarge ROI-window...
        p = get(EG.handles.h_roi_axes, 'position');
        p(1) = d_roi_left;
        p(2) = d_roi_bottom;
        p(3) = p_parent(3) - d_roi_left - d_roi_right;
        p(4) = p_parent(4) - d_roi_top - d_roi_bottom;
        set(EG.handles.h_roi_axes, 'position', p);
        set(EG.handles.h_roi_black, 'position', p);

        % Restore old units
        set(h,'Units',old_units);
    end

end
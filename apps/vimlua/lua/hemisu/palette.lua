-- hemisu/palette.lua
-- Extracted from `colors/hemisu.vim` (ported to Lua).

local M = {}

local function c(gui, cterm)
  return { gui = gui, cterm = tonumber(cterm) }
end

local base = {
  black = c("#000000", "16"),
  white = c("#FFFFFF", "231"),
  almostWhite = c("#EEEEEE", "255"),
  almostBlack = c("#111111", "233"),
  middleDarkGrey = c("#777777", "241"),
  middleLightGrey = c("#999999", "246"),
  lightGrey = c("#BBBBBB", "249"),
  darkGrey = c("#444444", "238"),

  darkPink = c("#63001C", "88"),
  middleDarkPink = c("#FF0055", "197"),
  middleLightPink = c("#D65E76", "167"),
  lightPink = c("#FFAFAF", "217"),

  darkBlue = c("#005F87", "24"),
  middleDarkBlue = c("#538192", "24"),
  middleLightBlue = c("#9FD3E6", "116"),
  lightBlue = c("#CBE4EE", "195"),

  darkGreen = c("#5F5F00", "58"),
  middleDarkGreen = c("#739200", "64"),
  middleLightGreen = c("#B1D631", "149"),
  lightGreen = c("#BBFFAA", "157"),

  darkTan = c("#503D15", "52"),
  lightTan = c("#ECE1C8", "230"),
}

local function for_dark()
  return {
    bg = base.black,
    norm = base.almostWhite,
    comment = base.middleDarkGrey,
    dimmed = base.middleLightGrey,
    subtle = base.darkGrey,
    faint = base.almostBlack,
    accent1 = base.middleLightBlue,
    accent2 = base.middleLightGreen,
    accent3 = base.lightGreen,
    accent4 = base.lightTan,

    normRed = base.middleLightPink,
    normGreen = base.middleLightGreen,
    normBlue = base.middleLightBlue,

    faintRed = base.darkPink,
    faintGreen = base.darkGreen,
    faintBlue = base.darkBlue,
  }
end

local function for_light()
  return {
    bg = base.white,
    norm = base.almostBlack,
    comment = base.middleLightGrey,
    dimmed = base.middleDarkGrey,
    subtle = base.lightGrey,
    faint = base.almostWhite,
    accent1 = base.middleDarkBlue,
    accent2 = base.middleDarkGreen,
    accent3 = base.middleDarkPink,
    accent4 = base.darkTan,

    normRed = base.middleDarkPink,
    normGreen = base.middleDarkGreen,
    normBlue = base.middleDarkBlue,

    faintRed = base.lightPink,
    faintGreen = base.lightGreen,
    faintBlue = base.lightBlue,
  }
end

function M.get(background)
  local bg = background or vim.o.background
  if bg == "light" then
    return for_light()
  end
  return for_dark()
end

return M

